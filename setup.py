import os
from setuptools import setup, find_packages
from torch.utils.cpp_extension import BuildExtension, CUDAExtension

setup(
    name="nvidia_cuda_accelerator",
    version="2.0.0",
    packages=find_packages(where="src"),
    package_dir={"": "src"},
    ext_modules=[
        CUDAExtension(
            name="nvidia_cuda_accelerator._C",
            sources=[
                "csrc/binding.cpp",
                "csrc/fused_kernel.cu",
            ],
            extra_compile_args={
                "cxx": ["-O3", "-march=native"],
                "nvcc": [
                    "-O3",
                    "--use_fast_math",
                    "-gencode=arch=compute_80,code=sm_80",  # Ampere
                    "-gencode=arch=compute_89,code=sm_89",  # Ada Lovelace
                    "-gencode=arch=compute_90,code=sm_90",  # Hopper
                ],
            },
        )
    ],
    cmdclass={
        "build_ext": BuildExtension
    },
    install_requires=[
        "torch>=2.1.0",
    ],
)
