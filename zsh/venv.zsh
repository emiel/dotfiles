function _zvenv_activate_venv() {
    local venv_dir="${1}";

    # Deactivate foreign venv if not the one we want to activate
    if [[ -n "${VIRTUAL_ENV}" && "${VIRTUAL_ENV}" != "${venv_dir}" ]] then
        echo "Deactivating venv: ${VIRTUAL_ENV}";
        deactivate
    fi

    # Activate venv if not already active
    if [[ "${venv_dir}" != "${VIRTUAL_ENV}" ]]
    then
        echo "Activating venv: ${venv_dir}";
        source "${venv_dir}/bin/activate"
    fi
}

function _zvenv_on_chpwd() {
    # The venv directory to test for
    local venv_dir="$PWD/venv";

    # Populate the allowed venv directories
    local allowed_venvs="${ZVENV_ALLOWED_VENVS:-()}";

    # Test for the existence of the venv directory
    if [[ -d "${venv_dir}" ]]
    then
        # To activate the venv directory it must be in the allow list
        if [[ $allowed_venvs[(i)$venv_dir] -le ${#allowed_venvs} ]]
        then
            _zvenv_activate_venv "${venv_dir}";
        else
            echo "Not activating ${venv_dir} because it is not included in ZVENV_ALLOWED_VENVS.";
        fi
    fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd _zvenv_on_chpwd
