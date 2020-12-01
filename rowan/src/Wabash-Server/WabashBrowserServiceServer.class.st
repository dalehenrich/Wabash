Class {
	#name : 'WabashBrowserServiceServer',
	#superclass : 'WabashBrowserService',
	#instVars : [
		'browserService',
		'projectServices'
	],
	#category : 'Wabash-Server'
}

{ #category : 'private' }
WabashBrowserServiceServer >> _browserService [
	^ browserService
		ifNil: [ 
			browserService := RowanBrowserService new
				updateProjects;
				yourself ]
]

{ #category : 'accessing' }
WabashBrowserServiceServer >> _projectServices [
	^ projectServices
		ifNil: [ 
			projectServices := Dictionary new.
			self _browserService _projects
				do: [ :svce | 
					| service |
					svce update.
					service := WabashProjectServiceServer new
						_projectService: svce;
						yourself.
					projectServices at: svce name put: service ].
			projectServices ]
]

{ #category : 'accessing' }
WabashBrowserServiceServer >> projectNamed: aString [
	^ self _projectServices at: aString
]

{ #category : 'accessing' }
WabashBrowserServiceServer >> projectNames [
	^ projectNames
		ifNil: [ projectNames := self _projectServices keys asArray sort ]
]
