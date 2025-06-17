{ config, pkgs, ...}: {

    programs.tmux = {
       enable = true; 
       extraConfig = ''
        unbind '"'
        unbind %
        unbind l
        unbind n
        unbind p
        unbind b
        unbind C-a
        
        # split panes using V and H
        bind H split-window -h
        bind V split-window -v
        # pane selection
        bind -n M-h select-pane -L
        bind -n M-j select-pane -D
        bind -n M-k select-pane -U
        bind -n M-l select-pane -R

        # special windows
        bind i display-popup -E 'zsh'

        # window navigation
        bind -n C-l next-window
        bind -n C-h previous-window

        # copy mode navigation (vim keys)
        setw -g mode-keys vi
        bind -T copy-mode-vi v send -X begin-selection
        bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel
        bind P paste-buffer
        bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel

        # mouse mode
        set -g mouse on
        # prevent auto rename
        # set-option -g allow-rename off
        #do auto indexing
        set-option -g renumber-windows on

        # more config
        set -g base-index 1
        setw -g pane-base-index 1

        #**************#
        ### THEMEING ###
        #**************#

        # loud or quiet
        set -g visual-activity off
        set -g visual-bell on
        set -g visual-silence off
        setw -g monitor-activity off
        set -g bell-action none

        set -g pane-border-style fg='#ffaf00'
        set -g pane-active-border-style fg='#ffaf00'

        set -g message-style bg='#44475a'
        set -g message-style fg='#8be9fd'

        set -g status-position bottom
        set -g status-style bg='#1c1c1c'
        set -g status-style fg='#ffaf00'
        set -g status-interval 1

        set -g window-status-current-format "#[fg=#ff87D7]#[bg=#bd93f9]#[fg=#2c2c2c]#[bg=#ffaf00] #I #W "

        set -g status-left '󱄅 #{tmux_mode_indicator}'
        set -g status-right-length 100
        set -g status-right ' '
        set -ga status-right '#[fg=#2c2c2c,bg=#5fd7af] %m-%d %I:%M %p '

        # plugins #
        run-shell ${pkgs.tmuxPlugins.sensible}/share/tmux-plugins/sensible/sensible.tmux
        run-shell ${pkgs.tmuxPlugins.prefix-highlight}/share/tmux-plugins/prefix-highlight/prefix-highlight.tmux
        run-shell ${pkgs.tmuxPlugins.mode-indicator}/share/tmux-plugins/mode-indicator/mode-indicator.tmux

        
       '';
    };



}
