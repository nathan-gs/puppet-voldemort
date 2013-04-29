class voldemort {

    package { 'voldemort':
        provider	=> rpm,
        source		=> 'https://dl.dropboxusercontent.com/u/25821613/rpms/voldemort-1.3.0-dc0.x86_64.rpm',
        ensure      => '1.3.0-dc0'
    }


}