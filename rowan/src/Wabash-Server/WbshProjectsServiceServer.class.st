Class {
	#name : 'WbshProjectsServiceServer',
	#superclass : 'WbshProjectsService',
	#category : 'Wabash-Server'
}

{ #category : 'accessing' }
WbshProjectsServiceServer >> projectNames [
	^ projectNames := (Rowan image loadedProjects collect: [:each | each name ]) asArray sort.
]
