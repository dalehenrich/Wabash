Class {
	#name : 'WbshProjectsServiceClient',
	#superclass : 'WbshProjectsService',
	#category : 'Wabash-Client'
}

{ #category : 'accessing' }
WbshProjectsServiceClient >> projectNames [
	^remoteSelf projectNames wait
]
