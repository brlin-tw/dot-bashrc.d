# .bashrc.d
[![Build Status](https://travis-ci.org/Lin-Buo-Ren/.bashrc.d.svg?branch=master)](https://travis-ci.org/Lin-Buo-Ren/.bashrc.d)  
This is a distributed bash run commands(rc) implementation

<https://github.com/Lin-Buo-Ren/.bashrc.d>

## How to use
Run the following command in your home directory in terminal:

```sh
git clone https://github.com/Lin-Buo-Ren/.bashrc.d
echo -e '\n# Setup .bashrc.d\n# https://github.com/Lin-Buo-Ren/.bashrc.d\nsource "${HOME}/.bashrc.d/README.setup"\n' >> "${HOME}/.bashrc"

```

Then restart Bash to make it affect

To disable certain rules, simply rename them so the filename expansion is not end with `source.bash` (e.g. `Setup blablabla.source.bash.disabled`) or move the files to `~/.bashrc.d.disabled`

## Author
林博仁 &lt;<Buo.Ren.Lin@gmail.com>&gt;

## License
GNU GPLv3+

