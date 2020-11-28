## Wabash
Experiments with RemoteServiceReplication

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
