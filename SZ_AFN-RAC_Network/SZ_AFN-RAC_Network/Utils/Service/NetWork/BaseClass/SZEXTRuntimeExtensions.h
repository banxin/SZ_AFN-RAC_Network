//
//  SZEXTRuntimeExtensions.h
//  SZ_AFN-RAC_Network
//
//  Created by yanl on 2018/2/6.
//  Copyright © 2018年 yanl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

/**
 * Describes the memory management policy of a property.
 */
typedef NS_ENUM(NSInteger, sz_propertyMemoryManagementPolicy) {
    
    /**
     * The value is assigned.
     */
    sz_propertyMemoryManagementPolicyAssign = 0,
    
    /**
     * The value is retained.
     */
    sz_propertyMemoryManagementPolicyRetain,
    
    /**
     * The value is copied.
     */
    sz_propertyMemoryManagementPolicyCopy
};

/**
 * Describes the attributes and type information of a property.
 */
typedef struct {
    /**
     * Whether this property was declared with the \c readonly attribute.
     */
    BOOL readonly;
    
    /**
     * Whether this property was declared with the \c nonatomic attribute.
     */
    BOOL nonatomic;
    
    /**
     * Whether the property is a weak reference.
     */
    BOOL weak;
    
    /**
     * Whether the property is eligible for garbage collection.
     */
    BOOL canBeCollected;
    
    /**
     * Whether this property is defined with \c \@dynamic.
     */
    BOOL dynamic;
    
    /**
     * The memory management policy for this property. This will always be
     * #mh_propertyMemoryManagementPolicyAssign if #readonly is \c YES.
     */
    sz_propertyMemoryManagementPolicy memoryManagementPolicy;
    
    /**
     * The selector for the getter of this property. This will reflect any
     * custom \c getter= attribute provided in the property declaration, or the
     * inferred getter name otherwise.
     */
    SEL getter;
    
    /**
     * The selector for the setter of this property. This will reflect any
     * custom \c setter= attribute provided in the property declaration, or the
     * inferred setter name otherwise.
     *
     * @note If #readonly is \c YES, this value will represent what the setter
     * \e would be, if the property were writable.
     */
    SEL setter;
    
    /**
     * The backing instance variable for this property, or \c NULL if \c
     * \c @synthesize was not used, and therefore no instance variable exists. This
     * would also be the case if the property is implemented dynamically.
     */
    const char *ivar;
    
    /**
     * If this property is defined as being an instance of a specific class,
     * this will be the class object representing it.
     *
     * This will be \c nil if the property was defined as type \c id, if the
     * property is not of an object type, or if the class could not be found at
     * runtime.
     */
    Class objectClass;
    
    /**
     * The type encoding for the value of this property. This is the type as it
     * would be returned by the \c \@encode() directive.
     */
    char type[];
} sz_propertyAttributes;

/**
 * Returns a pointer to a structure containing information about \a property.
 * You must \c free() the returned pointer. Returns \c NULL if there is an error
 * obtaining information from \a property.
 */
sz_propertyAttributes *sz_copyPropertyAttributes (objc_property_t property);
