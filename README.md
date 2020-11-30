## Wabash
Experiments with RemoteServiceReplication

### Wabash Server launch
```smalltalk
	| host port acceptor connection |
	host := '127.0.0.1'.
	port := 47652.
	acceptor := RsrAcceptConnection
		host: host
		port: port.
	[ connection := acceptor waitForConnection.
		true ] 
		whileTrue: [ connection waitUntilClose ]
```
### Wabash Client connect
```Smalltalk
	| host port initiator |
	host := '127.0.0.1'.
	port := 47652.
	initiator := RsrInitiateConnection host: host port: port.
	connection := initiator connect.
	client := connection serviceFor: #WbshProjectsServiceClient.
	client inspect.
``` 
Inspector is currently used to send messages to the client, like the following:
```smalltalk
self projectNames.
WbshProjectListExample openOn: self.
_connection close
```

### Wabash GemStone/Rowan load script
```smalltalk
(RwSpecification fromFile: '$ROWAN_PROJECTS_HOME/Wabash/rowan/specs/Wabash.ston')
	resolve
	load
```
### Wabash Pharo load script
```smalltalk
Metacello new
	baseline: 'Wabash';
	repository: 'tonel:///home/dhenrich/rogue/_homes/rogue/_home/shared/repos/Wabash/rowan/src';
	get;
	load
```
### Rowan project creation script
```smalltalk

| projectName projectSpecification resolvedProject projectsHome projectRoot componentName |
projectName := 'Wabash'.
projectsHome := '$ROWAN_PROJECTS_HOME' asFileReference.
projectRoot := projectsHome / projectName.
componentName := 'Core'.

projectSpecification := RwResolvedProjectV2 new
	projectName: projectName;
	projectsHome: projectsHome;
	gitUrl: 'file://' , projectRoot pathString;
	packageConvention: 'Rowan';
	packageFormat: 'tonel';
	yourself.

resolvedProject := projectSpecification resolve.

resolvedProject addTopLevelComponentNamed: componentName.

(resolvedProject addPackageNamed: 'Wabash-Core' toComponentNamed: componentName).

resolvedProject
	export;
	exportLoadSpecification.
```
