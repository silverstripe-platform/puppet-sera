class sera (
	String $version,
	String $dbuser,
	String $dbpassword,
	String $dbserver,
) {
	archive { "/tmp/sera_${version}_linux_amd64.tar.gz":
		provider     => 'curl',
		source       => "https://github.com/silverstripe-platform/sera/releases/download/${version}/sera_${version}_linux_amd64.tar.gz",
		cleanup      => true,
		extract      => true,
		extract_path => "/usr/local/bin",
		creates      => "/usr/local/bin/sera",
	}
	
	file { "/usr/local/bin/sera":
		owner => "root",
		group => "root",
		mode => "0755",
	}
	
	file { "/etc/sera.json":
		content => template("sera/sera.json.erb"),
		owner => "root",
		group => "root",
		mode => "0644",
	}
}
