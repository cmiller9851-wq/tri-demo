#include <cuda_runtime.h>
#include <torch/extension.h>

// CUDA Kernel: Fused GEMM Elementwise ReLU
__global__ void fused_matmul_relu_kernel(const float* __restrict__ A, 
                                        const float* __restrict__ B, 
                                        float* __restrict__ C, 
                                        int N) {
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < N && col < N) {
        float sum = 0.0f;
        #pragma unroll 4
        for (int k = 0; k < N; ++k) {
            sum += A[row * N + k] * B[k * N + col];
        }
        // Inline Fused Activation (ReLU)
        C[row * N + col] = sum > 0.0f ? sum : 0.0f;
    }
}

// C++ Host Invoker Function
torch::Tensor fused_matmul_relu_cuda(torch::Tensor A, torch::Tensor B) {
    const int N = A.size(0);
    auto options = torch::TensorOptions().dtype(torch::kFloat32).device(A.device());
    auto C = torch::empty({N, N}, options);

    dim3 threadsPerBlock(16, 16);
    dim3 numBlocks((N + threadsPerBlock.x - 1) / threadsPerBlock.x,
                   (N + threadsPerBlock.y - 1) / threadsPerBlock.y);

    // Fetch active stream
    cudaStream_t stream = at::cuda::getCurrentCUDAStream();

    fused_matmul_relu_kernel<<<numBlocks, threadsPerBlock, 0, stream>>>(
        A.data_ptr<float>(),
        B.data_ptr<float>(),
        C.data_ptr<float>(),
        N
    );

    return C;
}
