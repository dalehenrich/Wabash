Class {
	#name : 'WbshProjectsService',
	#superclass : 'RsrService',
	#instVars : [
		'projectNames'
	],
	#category : 'Wabash-Core'
}

{ #category : 'accessing' }
WbshProjectsService class >> templateClassName [

	^#'WbshProjectsService'
]

{ #category : 'accessing' }
WbshProjectsService >> projectNames [
	^projectNames
]

{ #category : 'accessing' }
WbshProjectsService >> projectNames: object [
	projectNames := object
]
