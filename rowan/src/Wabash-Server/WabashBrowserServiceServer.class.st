Class {
	#name : 'WabashBrowserServiceServer',
	#superclass : 'WabashBrowserService',
	#instVars : [
		'browserService'
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
WabashBrowserServiceServer >> projectNames [
	^ projectNames
		ifNil: [ projectNames :=  (self _browserService _projects collect: [ :each | each name ]) asArray ]
]
