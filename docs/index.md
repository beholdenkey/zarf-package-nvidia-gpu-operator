# Nvidia GPU Operator Container Image References

- [NVIDIA Data Center GPU Manager (DCGM)](https://catalog.ngc.nvidia.com/orgs/nvidia/teams/cloud-native/containers/dcgm)
- [DCGM Exporter](https://catalog.ngc.nvidia.com/orgs/nvidia/teams/k8s/containers/dcgm-exporter)
- [NVIDIA Kubernetes Device Plugin](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/k8s-device-plugin)
- [Validator for NVIDIA GPU Operator](https://catalog.ngc.nvidia.com/orgs/nvidia/teams/cloud-native/containers/gpu-operator-validator)
- [NVIDIA GPU Feature Discovery for Kubernetes](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/gpu-feature-discovery)
- [NVIDIA GPU Driver](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/driver)
- [NVIDIA Container Toolkit](https://catalog.ngc.nvidia.com/orgs/nvidia/teams/k8s/containers/container-toolkit)
- [NVIDIA Driver Manager For Kubernetes](https://catalog.ngc.nvidia.com/orgs/nvidia/teams/cloud-native/containers/k8s-driver-manager)
- [NVIDIA CUDA](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/cuda)
- [NVIDIA GPU Operator](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/gpu-operator)
- [NVIDIA MIG Manager For Kubernetes](https://catalog.ngc.nvidia.com/orgs/nvidia/teams/cloud-native/containers/k8s-mig-manager)
- [NVIDIA Driver Manager For Kubernetes](https://catalog.ngc.nvidia.com/orgs/nvidia/teams/cloud-native/containers/k8s-driver-manager)
- [NVIDIA vGPU Device Manager](https://catalog.ngc.nvidia.com/orgs/nvidia/teams/cloud-native/containers/vgpu-device-manager)

## GPU Operator Component Matrix

The following table shows the operands and default operand versions that correspond to a GPU Operator version.

When post-release testing confirms support for newer versions of operands, these updates are identified as recommended updates to a GPU Operator version. Refer to _Upgrading the NVIDIA GPU Operator_ for more information.

| Component                                                                                                                                           | Version                                     |
| --------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------- |
| [**NVIDIA GPU Operator**](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/gpu-operator)                                                       | v24.3.0                                     |
| [**NVIDIA GPU Driver**](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/driver)                                                               | 470.239.06 (default), 535.161.08, 550.54.15 |
| [**Nvidia vGPU Driver**](https://catalog.ngc.nvidia.com/orgs/nvidia/teams/vgpu/containers/vgpu-guest-driver-5)                                      | 550.54.15 (default)                         |
| [**NVIDIA Driver Manager for K8s**](https://catalog.ngc.nvidia.com/orgs/nvidia/teams/cloud-native/containers/k8s-driver-manager)                    | v0.6.8                                      |
| [**NVIDIA Container Toolkit**](https://catalog.ngc.nvidia.com/orgs/nvidia/teams/k8s/containers/container-toolkit)                                   | 1.15.0                                      |
| [**NVIDIA Kubernetes Device Plugin**](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/k8s-device-plugin)                                      | 0.15.0                                      |
| [**DCGM Exporter**](https://catalog.ngc.nvidia.com/orgs/nvidia/teams/k8s/containers/dcgm-exporter)                                                  | 3.3.5-3.4.1                                 |
| **Node Feature Discovery**                                                                                                                          | v0.15.4                                     |
| [**NVIDIA GPU Feature Discovery for Kubernetes**](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/gpu-feature-discovery)                      | 0.15.0                                      |
| [**NVIDIA MIG Manager for Kubernetes**](https://catalog.ngc.nvidia.com/orgs/nvidia/teams/cloud-native/containers/k8s-mig-manager)                   | 0.7.0                                       |
| [**DCGM**](https://catalog.ngc.nvidia.com/orgs/nvidia/teams/cloud-native/containers/dcgm)                                                           | 3.3.5-1                                     |
| [**Validator for NVIDIA GPU Operator**](https://catalog.ngc.nvidia.com/orgs/nvidia/teams/cloud-native/containers/gpu-operator-validator)            | v24.3.0                                     |
| [**NVIDIA KubeVirt GPU Device Plugin**](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/kubevirt-gpu-device-plugin)                           | v1.2.7                                      |
| [**NVIDIA vGPU Device Manager**](https://catalog.ngc.nvidia.com/orgs/nvidia/teams/cloud-native/containers/vgpu-device-manager)                      | v0.2.6                                      |
| [**NVIDIA GDS Driver**](https://catalog.ngc.nvidia.com/orgs/nvidia/teams/cloud-native/containers/nvidia-fs)                                         | 2.17.5                                      |
| [**NVIDIA Kata Manager for Kubernetes**](https://catalog.ngc.nvidia.com/orgs/nvidia/teams/cloud-native/containers/k8s-kata-manager)                 | v0.2.0                                      |
| [**NVIDIA Confidential Computing Manager for Kubernetes**](https://catalog.ngc.nvidia.com/orgs/nvidia/teams/cloud-native/containers/k8s-cc-manager) | v0.1.1                                      |
| [**NVIDIA GDRCopy Driver**](https://catalog.ngc.nvidia.com/orgs/nvidia/teams/cloud-native/containers/gdrdrv)                                        | v2.4.1                                      |
| [**Nvidia Cuda Base**](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/cuda)                                                                  | 12.4.1                                      |

> [!NOTE]
> Check [here](https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/latest/platform-support.html) for the latest supported versions.

## Dependencies

### CentOS / Rocky Linux / AlmaLinux

```bash
sudo dnf install kernel-devel -y
sudo dnf install kernel-headers -y
sudo dnf groupinstall "Development Tools" -y
sudo dnf distro-sync
```

Ubuntu / Debian

```bash
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install build-essential -y
sudo apt-get install linux-headers-$(uname -r) -y
```

```bash
    helm install --wait nvidiagpu \
     -n gpu-operator --create-namespace \
    --set toolkit.env[0].name=CONTAINERD_CONFIG \
    --set toolkit.env[0].value=/var/lib/rancher/k3s/agent/etc/containerd/config.toml \
    --set toolkit.env[1].name=CONTAINERD_SOCKET \
    --set toolkit.env[1].value=/run/k3s/containerd/containerd.sock \
    --set toolkit.env[2].name=CONTAINERD_RUNTIME_CLASS \
    --set toolkit.env[2].value=nvidia \
    --set toolkit.env[3].name=CONTAINERD_SET_AS_DEFAULT \
    --set-string toolkit.env[3].value=true \
     nvidia/gpu-operator
```

## References

- [WSL2 Support](https://github.com/NVIDIA/gpu-operator/issues/318)
