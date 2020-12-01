Class {
	#name : 'WabashClassService',
	#superclass : 'RsrService',
	#instVars : [
		'className',
		'instanceMethodNames',
		'classMethodNames'
	],
	#category : 'Wabash-Core'
}

{ #category : 'accessing' }
WabashClassService class >> templateClassName [

	^ #WabashClassService
]

{ #category : 'accessing' }
WabashClassService >> classMethodNamed: aString [
	self subclassResponsibility
]

{ #category : 'accessing' }
WabashClassService >> classMethodNames [
	self subclassResponsibility
]

{ #category : 'accessing' }
WabashClassService >> instanceMethodNamed: aString [
	self subclassResponsibility
]

{ #category : 'accessing' }
WabashClassService >> instanceMethodNames [
	self subclassResponsibility
]
