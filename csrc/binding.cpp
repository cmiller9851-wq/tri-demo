#include <torch/extension.h>

// Forward declaration
torch::Tensor fused_matmul_relu_cuda(torch::Tensor A, torch::Tensor B);

#define CHECK_CUDA(x) TORCH_CHECK(x.device().is_cuda(), #x " must be a CUDA tensor")
#define CHECK_CONTIGUOUS(x) TORCH_CHECK(x.is_contiguous(), #x " must be contiguous")
#define CHECK_INPUT(x) CHECK_CUDA(x); CHECK_CONTIGUOUS(x)

torch::Tensor fused_matmul_relu(torch::Tensor A, torch::Tensor B) {
    CHECK_INPUT(A);
    CHECK_INPUT(B);
    return fused_matmul_relu_cuda(A, B);
}

PYBIND11_MODULE(TORCH_EXTENSION_NAME, m) {
    m.def("fused_matmul_relu", &fused_matmul_relu, "Fused MatMul + ReLU (CUDA)");
}
