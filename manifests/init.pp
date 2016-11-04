class sera (
	$version,
	$dbuser,
	$dbpassword,
	$dbserver,
) {

	validate_string($version)
	validate_string($dbuser)
	validate_string($dbpassword)
	validate_string($dbserver)

	archive { "/tmp/sera_${version}_linux_amd64.tar.gz":
		provider     => 'curl',
		source       => "https://github.com/silverstripe-labs/sera/releases/download/${version}/sera_${version}_linux_amd64.tar.gz",
		cleanup      => true,
		extract      => true,
		extract_path => "/usr/local/bin",
		creates      => "/usr/local/bin/sera",
	}
	file { "/etc/sera.json":
		content => template("sera/sera.json.erb"),
		owner => "root",
		group => "root",
		mode => 0644;
	}

}
