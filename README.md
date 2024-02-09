# Yufei's Personal Terraform Modules

## Introduction

The goals of this repository are to provide a set of reusable Terraform modules that can be used to deploy infrastructure for my personal projects. Don't use it immediatly. But the modules are also designed to be as simple as possible, so that they can be easily understood and modified.

For it for free, but use it at your own risk.

## Usage

In my use case, I have file structure like this:

```
.
├── infra/
|   ├── modules/ # Git-submodule link to this repo
|   |   ├── bytebase/
|   |   ├── .../
|   ├── stack/
|   |   ├── .env.local
|   |   ├── main.tf
|   |   ├── project1.tf
|   |   ├── project2.tf
|   |   ├── ...
|   ├── db/
|   |   ├── ddl/
|   |   ├── dml/
|   |   ├── ...
|   ├── ...
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
