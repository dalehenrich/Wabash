Class {
	#name : 'WbshProjectsServiceServer',
	#superclass : 'WbshProjectsService',
	#category : 'Wabash-Server'
}

{ #category : 'accessing' }
WbshProjectsServiceServer >> projectNames [
	^ projectNames := Rowan projectNames.
]
