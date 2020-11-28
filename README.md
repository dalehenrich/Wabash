## Wabash
Experiments with RemoteServiceReplication

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
	yourself.

resolvedProject := projectSpecification resolve.

resolvedProject addNewComponentNamed: componentName.

(resolvedProject addPackageNamed: 'Wabash-Core' toComponentNamed: componentName).

resolvedProject
	export;
	exportLoadSpecification.
```
