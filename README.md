# .bashrc.d

Distributed bash run commands(rc) management solution.

<https://github.com/brlin-tw/dot-bashrc.d>  
[![GitHub Actions workflow status badge](https://github.com/brlin-tw/dot-bashrc.d/actions/workflows/check-potential-problems.yml/badge.svg "GitHub Actions workflow status")](https://github.com/brlin-tw/dot-bashrc.d/actions/workflows/check-potential-problems.yml) [![pre-commit enabled badge](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white "This project uses pre-commit to check potential problems")](https://pre-commit.com/) [![REUSE Specification compliance badge](https://api.reuse.software/badge/github.com/brlin-tw/dot-bashrc.d "This project complies to the REUSE specification to decrease software licensing costs")](https://api.reuse.software/info/github.com/brlin-tw/dot-bashrc.d)

## Usage

Follow the following instructions to incorporate .bashrc.d to your user session:

1. Download the release archive from [the Releases page](https://github.com/brlin-tw/dot-bashrc.d/releases).
1. Extract the downloaded release archive.
1. Launch a text terminal.
1. Run the product installation program by running the following command:

    ```bash
    if ! cd /path/to/dot-bashrc.d-X.Y.Z/install.sh; then
        printf 'Error: Unable to install .bashrc.d.\n' 1>&2
    fi
    ```

1. Restart your bash session to load the changes.

To disable certain rules, simply rename them so the filename expansion is not end with `source.sh` (e.g. `Setup blablabla.source.sh.disabled`) or move the files to `~/.bashrc.d.disabled`.

## Licensing

Unless otherwise noted(individual file's header/[REUSE.toml](REUSE.toml)), this product is licensed under [the version 3 of the GNU General Public License](https://www.gnu.org/licenses/gpl-3.0.html.en), or any of its recent versions you would prefer.

This work complies to [the REUSE Specification](https://reuse.software/spec/), refer the [REUSE - Make licensing easy for everyone](https://reuse.software/) website for info regarding the licensing of this product.

## References

The following material are referenced during the development of this project:

* [Git - gitattributes Documentation](https://git-scm.com/docs/gitattributes)  
  Explains the format of the Git path attributes file.
