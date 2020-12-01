Class {
	#name : 'WabashProjectServiceServer',
	#superclass : 'WabashProjectService',
	#instVars : [
		'projectService',
		'packageServices'
	],
	#category : 'Wabash-Server'
}

{ #category : 'private' }
WabashProjectServiceServer >> _packageServices [
	^ packageServices
		ifNil: [ 
			packageServices := Dictionary new.
			self _projectService packageServices
				do: [ :ps | 
					| service |
					ps update.
					service := WabashPackageServiceServer new
						_packageService: ps;
						yourself.
					packageServices at: ps packageName put: service ].
			packageServices ]
]

{ #category : 'private' }
WabashProjectServiceServer >> _projectService [
	^ projectService
]

{ #category : 'private' }
WabashProjectServiceServer >> _projectService: object [
	projectService := object
]

{ #category : 'accessing' }
WabashProjectServiceServer >> packageNamed: aString [
	^ self _packageServices at: aString
]

{ #category : 'accessing' }
WabashProjectServiceServer >> packageNames [
	^ packageNames
		ifNil: [ packageNames := self _packageServices keys asArray sort ]
]
