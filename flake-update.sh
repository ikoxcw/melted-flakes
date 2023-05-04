function trap_ctrlc {
    echo "Ctrl-C caught...exiting."
    exit 1
}
trap "trap_ctrlc" 2

flake_input=(
    colmena
    disko
    emacs-overlay
    flake-parts
    flake-root
    home-manager
    hypr-contrib
    hyprland
    hyprpicker
    impermanence
    mission-control
    nixpkgs
    nur
    picom
    sops-nix
    lanzaboote
    rust-overlay
    neovim-nightly-overlay
    treefmt-nix
)
for item in "${flake_input[@]}"
do
    echo -e "\033[1;34m${item}: \033[0m"
    nix flake lock --update-input "$item"
done
