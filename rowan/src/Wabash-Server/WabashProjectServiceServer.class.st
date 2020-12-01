Class {
	#name : 'WabashProjectServiceServer',
	#superclass : 'WabashProjectService',
	#instVars : [
		'projectService',
		'packageServices'
	],
	#category : 'Wabash-Server'
}

{ #category : 'accessing' }
WabashProjectServiceServer >> packageNames [
	^ packageNames
		ifNil: [ packageNames := self packageServices keys asArray sort ]
]

{ #category : 'private' }
WabashProjectServiceServer >> packageServices [
	^ packageServices
		ifNil: [ 
			packageServices := Dictionary new.
			self projectService packageServices
				do: [ :ps | packageServices at: ps packageName put: ps ].
			packageServices ]
]

{ #category : 'private' }
WabashProjectServiceServer >> projectService [
	^projectService
]

{ #category : 'private' }
WabashProjectServiceServer >> projectService: object [
	projectService := object
]
