Class {
	#name : 'WabashProjectService',
	#superclass : 'RsrService',
	#instVars : [
		'projectName',
		'packageNames',
		'packages'
	],
	#category : 'Wabash-Core'
}

{ #category : 'accessing' }
WabashProjectService class >> templateClassName [

	^ #WabashProjectService
]

{ #category : 'accessing' }
WabashProjectService >> packageNamed: aString [
	self subclassResponsibility
]

{ #category : 'accessing' }
WabashProjectService >> packageNames [
	self subclassResponsibility
]

{ #category : 'accessing' }
WabashProjectService >> packages [
	self subclassResponsibility
]
