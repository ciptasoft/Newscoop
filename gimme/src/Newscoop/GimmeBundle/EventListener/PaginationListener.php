<?php
/**
 * @package Newscoop\Gimme
 * @author Paweł Mikołajczuk <pawel.mikolajczuk@sourcefabric.org>
 * @copyright 2012 Sourcefabric o.p.s.
 * @license http://www.gnu.org/licenses/gpl-3.0.txt
 */

namespace Newscoop\GimmeBundle\EventListener;

use Symfony\Component\HttpKernel\HttpKernelInterface;
use Symfony\Component\HttpKernel\Event\GetResponseEvent;
use Symfony\Component\HttpFoundation\Request;
use Newscoop\Gimme\Pagination;
use Newscoop\Gimme\PartialResponse;

/**
 * Get parameters from request and set Pagination and PartialResponse objects to session
 */
class PaginationListener
{
    private $session;
    private $paginatorService;

    public function __construct($session, $paginatorService)
    {
        $this->session = $session;
        $this->paginatorService = $paginatorService;
    }

    public function onRequest(GetResponseEvent $event)
    {
        if (HttpKernelInterface::MASTER_REQUEST !== $event->getRequestType()) {
            return;
        }

        $request = $event->getRequest();

        $pagination = new Pagination();
        $partialResponse = new PartialResponse();

        if ($request->query->has('page')) {
            $pagination->setPage($request->query->get('page'));
        }

        if ($request->query->has('sort')) {
            $pagination->setSort($request->query->get('sort'));
        }

        if ($request->query->has('items_per_page')) {
            $pagination->setItemsPerPage($request->query->get('items_per_page'));
        }

        if ($request->query->has('fields')) {
            $partialResponse->setFields($request->query->get('fields'));
        }

        $this->session->set('pagination', $pagination);
        $this->paginatorService->setPagination($pagination);
        
        $this->session->set('partialResponse', $partialResponse);
    }
}