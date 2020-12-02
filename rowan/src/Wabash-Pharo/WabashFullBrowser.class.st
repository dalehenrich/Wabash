Class {
	#name : 'WabashFullBrowser',
	#superclass : 'ClyFullBrowser',
	#classVars : [
		'Connection'
	],
	#category : 'Wabash-Pharo'
}

{ #category : 'accessing' }
WabashFullBrowser class >> connection [

	^ Connection
]

{ #category : 'rsr' }
WabashFullBrowser class >> initiateConnection [
	| host port initiator |
	host := '127.0.0.1'.
	port := 47652.
	initiator := RsrInitiateConnection host: host port: port.
	Connection := initiator connect.

]

{ #category : 'opening' }
WabashFullBrowser class >> open [

	"
		Connection ifNotNil: [ Connection close.
		Connection := nil ].
	"

	<script>
	Connection ifNil: [ self initiateConnection ].
	^ self openOn: WabashNavigationEnvironment currentImage
]

{ #category : 'opening/closing' }
WabashFullBrowser >> close [

	super close.
	Connection ifNotNil: [ Connection close ].
	Connection := nil.

]

{ #category : 'navigation' }
WabashFullBrowser >> navigateSpawnedFullBrowser: aFullBrowser [

	self initiateConnection.
	^ super navigateSpawnedFullBrowser: aFullBrowser
]

{ #category : 'initialization' }
WabashFullBrowser >> newMethodGroupView [
	"Creates the 'method group' pane (formerly the 'protocol' pane)"

	^ self newNavigationView
		treeStructure: { 
			ClyMethodGroup -> #prepareSubgroupsQueryFrom:in: };
		requestNavigationBy: #methodGroupSelectionChanged;
		neverRestoreSelection
]

{ #category : 'initialization' }
WabashFullBrowser >> newPackageView [
	"Creates the package pane"
	| newPackageView |
	
	newPackageView := self newNavigationView
		treeStructure: 	{ 
			ClyProjectChildItem -> #prepareProjectItemsQueryFrom:in:.
			RPackage -> #prepareClassGroupQueryFrom:in: };
		enableFilterUsing: ClyRegexPattern new;
		requestNavigationBy: #packageSelectionChanged.
	newPackageView filterField announcer 
		when: RubTextChanged 
		send: #updateDefaultPackageFilter 
		to: self.
		
	^ newPackageView
]

{ #category : 'navigation' }
WabashFullBrowser >> spawnFullBrowser [
	
	^self spawnBrowser: WabashFullBrowser withState: [ :browser | 
		self navigateSpawnedFullBrowser: browser]
]

{ #category : 'private' }
WabashFullBrowser >> specifyClassItemNameOn: nameMorph for: classItem [
	| definition |
	nameMorph contents: classItem name.
	
	definition := classItem systemDefinition.
	
	self packageSelection isMultipleSelected ifTrue: [
		nameMorph contents: (definition printFullNameOf: classItem)].
	(self isPackagePartOfSelection: definition definingPackage) 
		ifFalse: [nameMorph color: self theme classExtensionColor]
]

{ #category : 'private' }
WabashFullBrowser >> specifyMethodItemNameOn: nameMorph for: methodItem [
	| definition |
	nameMorph contents: methodItem name.
	
	definition := methodItem	systemDefinition.
	(self isPackagePartOfSelection: definition definingPackage) ifFalse: [
		nameMorph color: self theme classExtensionColor].
	
	self classSelection isMultipleSelected ifTrue: [
		^nameMorph contents: (definition printFullNameOf: methodItem)].
	
	(self isClassSelected: definition definingClass) ifTrue: [ ^self].
	
	nameMorph emphasis: TextEmphasis italic emphasisCode.
	nameMorph contents: (definition printFullNameOf: methodItem)
]
