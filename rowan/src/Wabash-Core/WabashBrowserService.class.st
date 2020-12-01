Class {
	#name : 'WabashBrowserService',
	#superclass : 'RsrService',
	#instVars : [
		'projectNames'
	],
	#category : 'Wabash-Core'
}

{ #category : 'accessing' }
WabashBrowserService class >> templateClassName [

	^ #WabashBrowserService
]

{ #category : 'accessing' }
WabashBrowserService >> projectNamed: aString [
	self subclassResponsibility
]

{ #category : 'accessing' }
WabashBrowserService >> projectNames [
	self subclassResponsibility
]
