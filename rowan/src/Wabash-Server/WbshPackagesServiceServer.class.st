Class {
	#name : 'WbshPackagesServiceServer',
	#superclass : 'WbshPackagesService',
	#instVars : [
		'project'
	],
	#category : 'Wabash-Server'
}

{ #category : 'accessing' }
WbshPackagesServiceServer >> project [
	^project
]

{ #category : 'accessing' }
WbshPackagesServiceServer >> project: aRwProject [
	project := aRwProject
]
