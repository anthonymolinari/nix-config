{ ... }: {
    services.cron = {
        enable = true;
        systemCronJobs = [
            ''
            # backup services
            ''
            ''
            # clean up old builds
            ''
            ''
            # purge unused docker images 
            ''
        ];
    };
}
