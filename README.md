# windows-work-configuration

## list things to do

1. Setup powershell form widows store and copy setting.json into setting.json of powershell

2. Install scoop

```
iwr -useb get.scoop.sh | iex
```

3. Install curl, sudo and jq and wait to finish

```
scoop install curl sudo jq
```

4. Test curl with command

```
curl -s 'wttr.in/{Bangkok}?format=1
```

5. Install git

```
winget install -e --id Git.Git
```

6. Install neovim and gcc lib

```
scoop install neovim gcc
```

7. Set aliases for powershell profile  
   7.1 make directory for profile

   ```
   mkdir .config/powershell
   ```

   7.2 user neovim to write profile configuration

   ```
   nvim .config/powershell/user_profile.ps1
   ```

   7.3 copy code alias from user_profile.ps1 into .config/powershell/user_profile.ps1  
   7.4 create $PROFILE.CurrentUserCurrentHost file using command

   ```
   New-Item -path $profile -type file -force
   ```

   7.5 open nvim to edit alias powershell profile and put this command

   ```
   . $env:USERPROFILE\.config\powershell\user_profile.ps1
   ```

   7.6 open new powershell and test your alias command as ll or g or vim

8. Install posh git

```
Install-Module posh-git -Scope CurrentUser -Force
```

9. Install oh my posh

```
scoop install https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json
```

10. Add command after install oh-my-posh into user_profile.ps1

```
#Prompt
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt Paradox
```

re-load your powershell

11. Create prompt profile for oh-my-posh in the same directory of user_profile.ps1 with

```
vim xxx.omp.json
```

copy code from tohno.omp.json into it and reload your prompt

12. Set load startup oh-my-posh config for powershell

```
# Load prompt config @ initial powershell
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) 'tohno.omp.json'
oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression
```

copy code above into user_profile.ps1 and re-open your powershell

13. Install Terminal-Icons

```
Install-Module -Name Terminal-Icons -Repository PSGallery -Force
```

14. Set Load startup Terminal-Icons config into user_profile.ps1

```
# Terminal-Icons
Import-Module -Name Terminal-Icons
```

re-load your powershell

15. Install z Directory jumper

```
Install-Module -Name z -Force
```

16. Install PSReadLine - Autocompletion

```
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
```

17. Set PSReadLine - Autocompletion into user_profile.ps1

```
# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
```

re-load powershell

18. Install Fuzzy Finder

```
scoop install fzf
```

19. Install PSFzf

```
Install-Module -Name -Scope CurrentUser -Force
```

20. Setup fzf into user_profile.ps1

```
# fzf
Import-Module PSFzf
Set-PSFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'
```

re-load powershell

21. Add utility command which

```
# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
```

22. Additioning theme

    - Go to [theme | oh-my-posh](https://ohmyposh.dev/docs/themes)
    - find theme that you like then using command in powershell (can use just current terminal)
      ```
      Set-PoshPrompt name-your-theme
      ```
    - or you can change it perminantly you can edit into xxx.omp.json

23. Terminal Setup youtube credit link

    - [oh-my-posh setup windows 11](https://www.youtube.com/watch?v=5-aK2_WwrmM&t=748s)

24. After cd into repo then

    - Get into vim and type...

    ```
    :PackerSync
    ```

    - Please remember nvim will work completely when the order of mason, masonlsp-config and nvim-lspconfig look like this

    ```
    -- Mason: Portable package manager
    use({
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    })

    use({
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("configs.mason-lsp")
        end,
    })

    -- LSP
    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("configs.lsp")
        end,
    })
    ```
