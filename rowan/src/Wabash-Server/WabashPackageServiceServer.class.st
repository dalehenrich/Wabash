Class {
	#name : 'WabashPackageServiceServer',
	#superclass : 'WabashPackageService',
	#instVars : [
		'packageService',
		'classServices'
	],
	#category : 'Wabash-Server'
}

{ #category : 'accessing' }
WabashPackageServiceServer >> _classServices [
	^ classServices
		ifNil: [ 
			classServices := Dictionary new.
			self _packageService _classes
				do: [ :svce | 
					| service |
					svce update.
					service := WabashClassServiceServer new
						_classService: svce;
						yourself.
					classServices at: svce className put: service ].
			classServices ]
]

{ #category : 'accessing' }
WabashPackageServiceServer >> _packageService [
	^packageService
]

{ #category : 'accessing' }
WabashPackageServiceServer >> _packageService: object [
	packageService := object
]

{ #category : 'accessing' }
WabashPackageServiceServer >> classNamed: aString [
	^self _classServices at: aString
]

{ #category : 'accessing' }
WabashPackageServiceServer >> classNames [
	classNames ifNil: [ classNames := self _classServices keys asArray sort ]
]