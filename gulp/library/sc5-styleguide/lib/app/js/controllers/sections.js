angular.module('sgApp')
  .controller('SectionsCtrl', function($scope, $timeout, $stateParams, $location, $state, $rootScope, Styleguide) {

    $scope.config = Styleguide.config;

    if ($stateParams.section) {
      $scope.currentSection = $stateParams.section;
      $rootScope.currentSection = $scope.currentSection;
    }

    $rootScope.$watch(function() {
      return Styleguide.sections.data;
    }, function() {
      setPageTitle($scope.currentSection);
    });

    $rootScope.$watch(function() {
      return Styleguide.config.data;
    }, function() {
      setPageTitle($scope.currentSection);
    });

    // SuiteCommerce customization begins

    // Section '1' only shows variables definition, for that reason the markup section shouldn't be shown.
    $scope.showMarkupInSection = parseInt($scope.currentSection) >= 2;

    $timeout(function () {
      //DOM has finished rendering
      $('[data-toggle="tooltip"]').tooltip();
      $('[data-toggle="popover"]').popover();
      $('.bxslider').bxSlider();
    }, 1000);

    // SuiteCommerce customization ends

    function setPageTitle(section) {
      if (!Styleguide.config.data || !Styleguide.sections.data) {
        return;
      }
      if (section === 'all') {
        $rootScope.pageTitle = 'All sections - ' + Styleguide.config.data.title;
      } else {
        var result = Styleguide.sections.data.filter(function(item) {
          return item.reference === section;
        });
        if (result.length > 0) {
          $rootScope.pageTitle = result[0].reference + ' ' + result[0].header + ' - ' + Styleguide.config.data.title;

          // Update current reference even before user starts scrolling
          $rootScope.currentReference.section = result[0];
        }
      }
    }

    $scope.isMainSection = function(section) {
      return section.reference.indexOf('.') === -1;
    };

    $scope.isEmptyMainSection = function(section) {
      return section.reference.indexOf('.') === -1 && !section.renderMarkup && (!section.modifiers || section.modifiers.length === 0);
    };

    $scope.isActive = function(section) {
      return section.reference === $rootScope.currentReference.section.reference ? 'active' : '';
    };

    $scope.filterSections = function(section) {
      // Do not show anything with empty search. Showing all items have performance issues
      if ($state.is('app.index.search') && (!$scope.search || !$scope.search.$ || $scope.search.$.length < 3)) {
        return false;
      }
      if ($scope.currentSection === 'all') {
        return true;
      }
      if ( $scope.config.data.hideSubsectionsOnMainSection && ($scope.currentSection.indexOf('.') === -1)) {
        return new RegExp('^' + $scope.currentSection + '(\\{D}|$)').test(section.reference);
      }
      return new RegExp('^' + $scope.currentSection + '(\\D|$)').test(section.reference);
    };

    setPageTitle();
  });
