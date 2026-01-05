# ansible-lint

> ⚠️ **Project status: Read-Only / Archived**

This repository is **no longer actively maintained** and has been set to **read-only**.

The reason for this decision is that I have fully migrated to the
**container-based components provided by [pipeline-components.dev](https://pipeline-components.dev/components/ansible-lint/)**
for running Ansible-Lint. This approach is more maintainable,
reproducible, and better suited for modern CI/CD pipelines.

---

## Background

This project was originally created to make **ansible-lint** easy
and consistent to use in CI pipelines
(e.g. GitHub Actions, GitLab CI, Tekton).

With the evolution of **Pipeline Components**,
this repository has become functionally obsolete:

* 📦 Prebuilt and maintained container images
* 🔁 Clear versioning
* 🧩 Easy integration into existing pipelines
* 🚀 Significantly reduced maintenance effort

---

## Recommended Alternative (Successor)

👉 **pipeline-components / ansible-lint**
[https://pipeline-components.dev/components/ansible-lint/](https://pipeline-components.dev/components/ansible-lint/)

General usage concept:

* Use a prebuilt container image
* No local installation of `ansible-lint` required
* Reproducible linting results across all environments

For up-to-date usage instructions, configuration options, and examples,
please refer directly to the official Pipeline Component documentation.

---

## Repository Usage

* 🔒 Read-only
* ❌ No new features
* ❌ No bug fixes
* ❌ No releases

This repository remains available **for documentation and reference purposes only**.

---

## Migration

If you are currently using this repository:

1. Remove the direct dependency on this project
2. Integrate the `ansible-lint` Pipeline Component instead
3. Update your CI/CD configuration accordingly

In most cases, migration is straightforward, as the behavior of `ansible-lint` itself
remains unchanged.
