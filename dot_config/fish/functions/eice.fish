function eice --description "Easy way to set up ssh tunnel to private EC2 instance"
    argparse --stop-nonopt 'r/region=' -- $argv; or return

    set -l region us-east-1
    set -q _flag_region; and set region $_flag_region
    set -l instance_id $argv[1]

    ssh -i ~/.ssh/ec2-key-pair-sandbox-daniel-blum \
        -o ProxyCommand="aws ec2-instance-connect open-tunnel --region $region --instance-id $instance_id" \
        -o UserKnownHostsFile=/dev/null \
        -o StrictHostKeyChecking=no \
        -o LogLevel=ERROR \
        ubuntu@$argv[1] $argv[2..-1]
end

