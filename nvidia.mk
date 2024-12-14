CUDA_KEYRING_VERSION = 1.1
CUDA_KEYRING_REVISION = 1
CUDA_KEYRING_PACKAGE = cuda-keyring_$(CUDA_KEYRING_VERSION)-$(CUDA_KEYRING_REVISION)

$(REPO)/$(CUDA_KEYRING_PACKAGE).deb:
	echo "Downloading $(CUDA_KEYRING_PACKAGE)..."
	wget https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/cuda-keyring_$(CUDA_KEYRING_VERSION)-$(CUDA_KEYRING_REVISION)_all.deb -O $(REPO)/$(CUDA_KEYRING_PACKAGE).deb

