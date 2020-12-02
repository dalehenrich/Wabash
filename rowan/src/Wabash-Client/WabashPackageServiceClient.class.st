Class {
	#name : 'WabashPackageServiceClient',
	#superclass : 'WabashPackageService',
	#category : 'Wabash-Client'
}

{ #category : 'accessing' }
WabashPackageServiceClient >> classNamed: aString [
	^ (remoteSelf classNamed: aString) wait
]

{ #category : 'accessing' }
WabashPackageServiceClient >> classNames [
	^ remoteSelf classNames wait
]
