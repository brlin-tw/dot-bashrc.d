# .bashrc.d

Distributed bash run commands(rc) management solution.

<https://github.com/brlin-tw/dot-bashrc.d>  
[![GitHub Actions workflow status badge](https://github.com/brlin-tw/dot-bashrc.d/actions/workflows/check-potential-problems.yml/badge.svg "GitHub Actions workflow status")](https://github.com/brlin-tw/dot-bashrc.d/actions/workflows/check-potential-problems.yml) [![pre-commit enabled badge](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white "This project uses pre-commit to check potential problems")](https://pre-commit.com/) [![REUSE Specification compliance badge](https://api.reuse.software/badge/github.com/brlin-tw/dot-bashrc.d "This project complies to the REUSE specification to decrease software licensing costs")](https://api.reuse.software/info/github.com/brlin-tw/dot-bashrc.d)

## How to use

Run the following command in your home directory in terminal:

```bash
git clone https://github.com/brlin-tw/dot-bashrc.git
echo -e '\n# Setup .bashrc.d\n# https://github.com/brlin-tw/dot-bashrc\nsource "${HOME}/.bashrc.d/README.setup"\n' >> "${HOME}/.bashrc"
```

Then restart Bash to make it affect

To disable certain rules, simply rename them so the filename expansion is not end with `source.bash` (e.g. `Setup blablabla.source.bash.disabled`) or move the files to `~/.bashrc.d.disabled`

## Licensing

Unless otherwise noted(individual file's header/[REUSE.toml](REUSE.toml)), this product is licensed under [the version 3 of the GNU General Public License](https://www.gnu.org/licenses/gpl-3.0.html.en), or any of its recent versions you would prefer.

This work complies to [the REUSE Specification](https://reuse.software/spec/), refer the [REUSE - Make licensing easy for everyone](https://reuse.software/) website for info regarding the licensing of this product.
