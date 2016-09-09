default['mongodb']['config']['auth'] = true # Require authentication to access or modify the database

# root users works only with MongoDB3
default['mongodb']['users'] = [{
        'username' => 'can_do_everything',
        'password' => '5uP3r_s3cr3t!_read_from_unpublished_environment_file',
        'roles' => ['userAdminAnyDatabase', 'dbAdminAnyDatabase', 'clusterAdmin', 'userAdmin', 'readWrite'],
        'database' => 'admin'
    },
    {
        'username' => 'root_full_rights',
        'password' => '5uP3r_s3cr3t!_read_from_unpublished_environment_file',
        'roles' => ['root'],
        'database' => 'admin'
    }
]
