# Nvidia GPU Operator Zarf Package

A Zarf package for the Nvidia GPU Operator. This zarf package is intended to perform a complete installation of the Nvidia GPU Operator in disconnected environments. There is a great deal of backend engineering that has gone into this package to provide seamless end to end installation of the Nvidia GPU Operator.

> [!IMPORTANT]
> If you find any gaps in the zarf package please review the [Contributing](CONTRIBUTING.md) guide and submit an issue or pull request.

## Supported Operating Systems

| OS          | Version             | Notes                                        |
| ----------- | ------------------- | -------------------------------------------- |
| Ubuntu      | 20.04, 22.04        |                                              |
| Rocky Linux | 8, 9                |                                              |
| WSL2        | Ubuntu 22.04, 22.04 | Not Supported for Disconnected Installations |

## What is included in this package?

- Nvidia GPU Operator Helm Chart and Container Images, this includes container images for operating system specific drivers. To support different operating systems.
- An optional local package repository mirror, to support standalone disconnected installations. This will allow for the install of required packages without the need for an internet connection or pre-existing package repositories.

## What is not supported?

- VGPU is not supported by default as a Nvidia Enterprise Subscription is required.
- Red Hat Enterprise Linux CoreOS (RHCOS)/OpenShift is not supported by this package. However it can done if there is demand.

## References

- [Nvidia GPU Operator](https://github.com/NVIDIA/gpu-operator)
- [Nvidia GPU Operator Documentation](https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/latest/index.html)
- [Nvidia Container Registry](https://catalog.ngc.nvidia.com/containers)
