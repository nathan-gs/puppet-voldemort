class voldemort (
    $cluster_name = 'voldemort-cluster',
    $hosts_id,
    $hosts_partitions,
    $store_name = 'store0'
) {

    $myid = $hosts_id[$fqdn]

    package { 'voldemort':
        provider	=> rpm,
        source		=> 'https://dl.dropboxusercontent.com/u/25821613/rpms/voldemort-1.3.0-dc0.x86_64.rpm',
        ensure      => '1.3.0-dc0'
    }

    file { '/etc/voldemort/config/cluster.xml':
        content => template('voldemort/cluster.xml.erb')
        owner   => root,
        mode    => 644,
        require => Package['voldemort']
    }

    file { '/etc/voldemort/config/stores.xml':
        content => template('voldemort/stores.xml.erb')
        owner   => root,
        mode    => 644,
        require => Package['voldemort']
    }

    file { '/etc/voldemort/config/server.properties':
        content => template('voldemort/server.properties.erb')
        owner   => root,
        mode    => 644,
        require => Package['voldemort']
    }

}