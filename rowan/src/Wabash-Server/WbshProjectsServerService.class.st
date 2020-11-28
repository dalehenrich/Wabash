Class {
	#name : 'WbshProjectsServerService',
	#superclass : 'WbshProjectsService',
	#category : 'Wabash-Server'
}

{ #category : 'accessing' }
WbshProjectsServerService >> projectNames [
	projectNames := (Rowan image loadedProjects collect: [:each | each name ]) asArray sort
]
