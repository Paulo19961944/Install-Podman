# Podman Installer Multi-Distro

Script interativo para instalação e configuração do Podman em diferentes distribuições Linux:

- Arch Linux / CachyOS / Manjaro
- Debian / Ubuntu
- Red Hat / Fedora / CentOS

Inclui instalação de podman-compose, buildah e skopeo, além da ativação do socket em modo rootless.

---

## O que este projeto faz

- Detecta a distribuição via menu interativo
- Instala Podman e ferramentas auxiliares
  - podman
  - podman-compose
  - buildah
  - skopeo
- Ativa o socket do Podman em modo usuário
- Valida a instalação automaticamente
- Exibe informações do ambiente

---

## Instalação

Clone o repositório:

```bash
git clone https://github.com/Paulo19961944/Install-Podman/
cd Install-Podman
```

## Dê permissão de execução no script:

```bash
chmod +x install-podman.sh
```

## Uso

**Execute o script:**

```bash
install-podman.sh
```

### Selecione a distribuição:

```
1) Arch / CachyOS / Manjaro
2) Debian / Ubuntu
3) Red Hat / Fedora / CentOS
```

## Teste após instalação

**Verifique se o Podman está funcionando:**

```bash
podman --version
podman info
podman run hello-world
```

## Socket do Podman

**O Podman em modo rootless utiliza um socket por usuário:**

`$XDG_RUNTIME_DIR/podman/podman.sock`

**O script ativa automaticamente com:**

`systemctl --user enable --now podman.socket`


## Dependências instaladas

**Dependendo da distribuição:**

- podman
- podman-compose
- buildah
- skopeo


## Requisitos

- Linux com systemd
- Permissão sudo
- Usuário com sessão ativa (modo rootless)

## Observações
- O script utiliza Podman em modo rootless
- Compatível com uso em Portainer
- Funciona em ambiente desktop e servidor

## Possíveis melhorias futuras
- Detecção automática da distribuição sem menu
- Suporte a WSL2
- Setup automático do Portainer
- Criação de registry local
- Hardening de segurança
- Licença

## MIT License

**Paulo19961944**

Script criado para facilitar a instalação e configuração do Podman em múltiplas distribuições Linux.
