case $- in
    *i*) ;;
      *) return;;
esac

alias ll='ls -lA'

eval "$(starship init bash)"
