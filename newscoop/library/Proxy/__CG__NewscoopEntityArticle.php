<?php

namespace Proxy\__CG__\Newscoop\Entity;

/**
 * THIS CLASS WAS GENERATED BY THE DOCTRINE ORM. DO NOT EDIT THIS FILE.
 */
class Article extends \Newscoop\Entity\Article implements \Doctrine\ORM\Proxy\Proxy
{
    private $_entityPersister;
    private $_identifier;
    public $__isInitialized__ = false;
    public function __construct($entityPersister, $identifier)
    {
        $this->_entityPersister = $entityPersister;
        $this->_identifier = $identifier;
    }
    /** @private */
    public function __load()
    {
        if (!$this->__isInitialized__ && $this->_entityPersister) {
            $this->__isInitialized__ = true;

            if (method_exists($this, "__wakeup")) {
                // call this after __isInitialized__to avoid infinite recursion
                // but before loading to emulate what ClassMetadata::newInstance()
                // provides.
                $this->__wakeup();
            }

            if ($this->_entityPersister->load($this->_identifier, $this) === null) {
                throw new \Doctrine\ORM\EntityNotFoundException();
            }
            unset($this->_entityPersister, $this->_identifier);
        }
    }

    /** @private */
    public function __isInitialized()
    {
        return $this->__isInitialized__;
    }

    
    public function setId($p_id)
    {
        $this->__load();
        return parent::setId($p_id);
    }

    public function getId()
    {
        $this->__load();
        return parent::getId();
    }

    public function getName()
    {
        $this->__load();
        return parent::getName();
    }

    public function setPublication(\Newscoop\Entity\Publication $p_publication)
    {
        $this->__load();
        return parent::setPublication($p_publication);
    }

    public function getPublication()
    {
        $this->__load();
        return parent::getPublication();
    }

    public function getPublicationId()
    {
        $this->__load();
        return parent::getPublicationId();
    }

    public function getSection()
    {
        $this->__load();
        return parent::getSection();
    }

    public function getSectionId()
    {
        $this->__load();
        return parent::getSectionId();
    }

    public function getIssueId()
    {
        $this->__load();
        return parent::getIssueId();
    }

    public function getWorkflowStatus()
    {
        $this->__load();
        return parent::getWorkflowStatus();
    }

    public function setLanguage(\Newscoop\Entity\Language $p_language)
    {
        $this->__load();
        return parent::setLanguage($p_language);
    }

    public function getLanguage()
    {
        $this->__load();
        return parent::getLanguage();
    }

    public function getLanguageId()
    {
        $this->__load();
        return parent::getLanguageId();
    }

    public function getNumber()
    {
        if ($this->__isInitialized__ === false) {
            return (int) $this->_identifier["number"];
        }
        $this->__load();
        return parent::getNumber();
    }

    public function getTitle()
    {
        $this->__load();
        return parent::getTitle();
    }

    public function getDate()
    {
        $this->__load();
        return parent::getDate();
    }

    public function commentsEnabled()
    {
        $this->__load();
        return parent::commentsEnabled();
    }

    public function getType()
    {
        $this->__load();
        return parent::getType();
    }

    public function getPublishDate()
    {
        $this->__load();
        return parent::getPublishDate();
    }

    public function setCreator(\Newscoop\Entity\User $p_user)
    {
        $this->__load();
        return parent::setCreator($p_user);
    }

    public function getCreator()
    {
        $this->__load();
        return parent::getCreator();
    }

    public function setWebcode($webcode)
    {
        $this->__load();
        return parent::setWebcode($webcode);
    }

    public function getWebcode()
    {
        $this->__load();
        return parent::getWebcode();
    }

    public function hasWebcode()
    {
        $this->__load();
        return parent::hasWebcode();
    }


    public function __sleep()
    {
        return array('__isInitialized__', 'sectionId', 'issueId', 'number', 'name', 'shortName', 'date', 'comments_enabled', 'type', 'published', 'workflowStatus', 'articleOrder', 'public', 'onFrontPage', 'onSection', 'uploaded', 'keywords', 'isIndexed', 'lockTime', 'commentsLocked', 'objectId', 'language', 'publication', 'issue', 'section', 'creator', 'authors', 'lockUser', 'webcode');
    }

    public function __clone()
    {
        if (!$this->__isInitialized__ && $this->_entityPersister) {
            $this->__isInitialized__ = true;
            $class = $this->_entityPersister->getClassMetadata();
            $original = $this->_entityPersister->load($this->_identifier);
            if ($original === null) {
                throw new \Doctrine\ORM\EntityNotFoundException();
            }
            foreach ($class->reflFields AS $field => $reflProperty) {
                $reflProperty->setValue($this, $reflProperty->getValue($original));
            }
            unset($this->_entityPersister, $this->_identifier);
        }
        
    }
}