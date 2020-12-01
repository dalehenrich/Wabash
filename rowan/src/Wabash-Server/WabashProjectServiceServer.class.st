Class {
	#name : 'WabashProjectServiceServer',
	#superclass : 'WabashProjectService',
	#instVars : [
		'projectService'
	],
	#category : 'Wabash-Server'
}

{ #category : 'accessing' }
WabashProjectServiceServer >> packageNames [

	packageNames ifNil: [ self projectService packages]
]

{ #category : 'accessing' }
WabashProjectServiceServer >> projectService [
	^projectService
]

{ #category : 'accessing' }
WabashProjectServiceServer >> projectService: object [
	projectService := object
]
