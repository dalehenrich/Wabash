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
				do: [ :svce | 
					| service |
					svce update.
					service := WabashPackageServiceServer new
						packageName: svce name;
						_packageService: svce;
						yourself.
					packageServices at: svce name put: service ].
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

{ #category : 'accessing' }
WabashProjectServiceServer >> packages [
	^ packages
		ifNil: [ packages := self packageNames collect: [ :each | self packageNamed: each ] ]
]
