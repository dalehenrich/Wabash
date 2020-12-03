Class {
	#name : 'WabashPackageService',
	#superclass : 'RsrService',
	#instVars : [
		'packageName',
		'classNames'
	],
	#category : 'Wabash-Core'
}

{ #category : 'accessing' }
WabashPackageService class >> templateClassName [

	^ #WabashPackageService
]

{ #category : 'accessing' }
WabashPackageService >> classNamed: aString [
	self subclassResponsibility
]

{ #category : 'accessing' }
WabashPackageService >> classNames [
	self subclassResponsibility
]

{ #category : 'accessing' }
WabashPackageService >> packageName [
	self subclassResponsibility
]
