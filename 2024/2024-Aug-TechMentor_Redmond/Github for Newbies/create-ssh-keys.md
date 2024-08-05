## Creating and Testing SSH Keys for GitHub

### Create the key pair:

```powershell
ssh-keygen -t ed25519 -C "demo@your_domain.com"
```

- When you're prompted to "Enter a file in which to save the key", you can press Enter to accept the default file location.
- At the prompt, type a secure passphrase. Then, re-enter it when prompted.
- Add it to your ssh-agent:

```powershell
ssh-add ~/.ssh/github_demo
```

- Add it to your GitHub Settings:

  - Copy the contents of the public key file to your clipboard:
  - Go to your GitHub account settings, and click on SSH and GPG keys.
  - Click on New SSH key, and paste the public key into the Key field.
  - Click Add SSH key.
  - Confirm the action by entering your GitHub password.

- Test the connection:

```powershell
  ssh -T git@github.com
```

- You may see a message like this:

```
The authenticity of host 'github.com (IP ADDRESS)' can't be established.
ED25519 key fingerprint is SHA256:+DiY3wvvV6TuJJhbpZisF/zLDA0zPMSvHdkr4UvCOqU.
Are you sure you want to continue connecting (yes/no)?
```

- If you see a message like this, you've successfully authenticated with GitHub:

```powershell
  Hi username! You've successfully authenticated, but GitHub does not provide shell access.
```

- SSH to GitHub is now complete. You can now use SSH to clone repositories, push changes, and perform other Git operations that require authentication.
- If you have any issues, refer to the [GitHub documentation](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh).
