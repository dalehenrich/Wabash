Class {
	#name : 'WabashMethodService',
	#superclass : 'RsrService',
	#instVars : [
		'methodName'
	],
	#category : 'Wabash-Core'
}

{ #category : 'accessing' }
WabashMethodService class >> templateClassName [

	^ #WabashMethodService
]

{ #category : 'accessing' }
WabashMethodService >> methodName [
	self subclassResponsibility
]
