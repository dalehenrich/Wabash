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
	^ packageNames ifNil: [ packageNames := self projectService packageNames asArray sort]
]

{ #category : 'accessing' }
WabashProjectServiceServer >> projectService [
	^projectService
]

{ #category : 'accessing' }
WabashProjectServiceServer >> projectService: object [
	projectService := object
]
