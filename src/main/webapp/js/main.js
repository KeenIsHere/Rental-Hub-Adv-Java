document.addEventListener('DOMContentLoaded', function() {
    // Mobile Menu Toggle
    const menuToggle = document.querySelector('.menu-toggle');
    const nav = document.querySelector('nav');

    if (menuToggle) {
        menuToggle.addEventListener('click', function() {
            menuToggle.classList.toggle('active');
            nav.classList.toggle('active');
        });
    }

    // Tab Navigation
    const tabButtons = document.querySelectorAll('.tab-btn');

    if (tabButtons.length > 0) {
        tabButtons.forEach(button => {
            button.addEventListener('click', function() {
                const tabId = this.getAttribute('data-tab');
                const tabContent = document.getElementById(`${tabId}-tab`);

                // Remove active class from all buttons and content
                document.querySelectorAll('.tab-btn').forEach(btn => btn.classList.remove('active'));
                document.querySelectorAll('.tab-content').forEach(content => content.classList.remove('active'));

                // Add active class to clicked button and corresponding content
                this.classList.add('active');
                if (tabContent) {
                    tabContent.classList.add('active');
                }
            });
        });
    }

    // Property Form Submission
    const propertyForm = document.getElementById('property-form');
    const submissionSuccess = document.getElementById('submission-success');

    if (propertyForm) {
        propertyForm.addEventListener('submit', function(e) {
            e.preventDefault();

            // Simulate form submission
            setTimeout(() => {
                propertyForm.style.display = 'none';
                if (submissionSuccess) {
                    submissionSuccess.style.display = 'block';
                }
            }, 1000);
        });
    }

    // Password Form Submission
    const passwordForm = document.getElementById('password-form');
    const passwordSuccess = document.getElementById('password-success');

    if (passwordForm) {
        passwordForm.addEventListener('submit', function(e) {
            e.preventDefault();

            const newPassword = document.getElementById('new-password').value;
            const confirmPassword = document.getElementById('confirm-password').value;

            if (newPassword !== confirmPassword) {
                alert('Passwords do not match!');
                return;
            }

            // Simulate form submission
            setTimeout(() => {
                passwordForm.style.display = 'none';
                if (passwordSuccess) {
                    passwordSuccess.style.display = 'block';
                }
            }, 1000);
        });
    }

    // Admin Property Approval/Decline
    const approveButtons = document.querySelectorAll('.btn-approve');
    const declineButtons = document.querySelectorAll('.btn-decline');

    if (approveButtons.length > 0) {
        approveButtons.forEach(button => {
            button.addEventListener('click', function() {
                const propertyId = this.getAttribute('data-id');
                const propertyCard = document.getElementById(propertyId);

                if (propertyCard) {
                    // Simulate approval
                    propertyCard.style.opacity = '0.5';
                    setTimeout(() => {
                        propertyCard.remove();

                        // Update pending count if it exists
                        const pendingCount = document.querySelector('.stat-number:nth-child(3)');
                        if (pendingCount) {
                            const currentCount = parseInt(pendingCount.textContent);
                            pendingCount.textContent = currentCount - 1;
                        }

                        // Update approved count if it exists
                        const approvedCount = document.querySelector('.stat-number:nth-child(2)');
                        if (approvedCount) {
                            const currentCount = parseInt(approvedCount.textContent);
                            approvedCount.textContent = currentCount + 1;
                        }
                    }, 500);
                }
            });
        });
    }

    if (declineButtons.length > 0) {
        declineButtons.forEach(button => {
            button.addEventListener('click', function() {
                const propertyId = this.getAttribute('data-id');
                const propertyCard = document.getElementById(propertyId);

                if (propertyCard) {
                    // Simulate decline
                    propertyCard.style.opacity = '0.5';
                    setTimeout(() => {
                        propertyCard.remove();

                        // Update pending count if it exists
                        const pendingCount = document.querySelector('.stat-number:nth-child(3)');
                        if (pendingCount) {
                            const currentCount = parseInt(pendingCount.textContent);
                            pendingCount.textContent = currentCount - 1;
                        }
                    }, 500);
                }
            });
        });
    }

    // Block User Functionality
    const blockButtons = document.querySelectorAll('.btn-block');

    if (blockButtons.length > 0) {
        blockButtons.forEach(button => {
            button.addEventListener('click', function() {
                const userCard = this.closest('.user-card');

                if (userCard) {
                    if (this.textContent === 'Block User') {
                        this.textContent = 'Unblock User';
                        this.classList.add('btn-secondary');
                        this.classList.remove('btn-block');
                        userCard.style.opacity = '0.6';
                    } else {
                        this.textContent = 'Block User';
                        this.classList.add('btn-block');
                        this.classList.remove('btn-secondary');
                        userCard.style.opacity = '1';
                    }
                }
            });
        });
    }

    // More Filters Toggle
    const moreFiltersBtn = document.getElementById('more-filters-btn');
    const advancedFilters = document.getElementById('advanced-filters');

    if (moreFiltersBtn && advancedFilters) {
        moreFiltersBtn.addEventListener('click', function() {
            if (advancedFilters.style.display === 'none' || advancedFilters.style.display === '') {
                advancedFilters.style.display = 'block';
                this.textContent = 'Less Filters';
            } else {
                advancedFilters.style.display = 'none';
                this.textContent = 'More Filters';
            }
        });
    }

    // Clear Filters
    const clearFiltersBtn = document.getElementById('clear-filters-btn');

    if (clearFiltersBtn) {
        clearFiltersBtn.addEventListener('click', function() {
            const filterInputs = document.querySelectorAll('.filter-group input, .filter-group select');
            const filterCheckboxes = document.querySelectorAll('.filter-group input[type="checkbox"]');

            filterInputs.forEach(input => {
                input.value = '';
            });

            filterCheckboxes.forEach(checkbox => {
                checkbox.checked = false;
            });
        });
    }

    // View Toggle (Grid/List)
    const viewButtons = document.querySelectorAll('.view-btn');
    const propertyContainer = document.getElementById('property-container');

    if (viewButtons.length > 0 && propertyContainer) {
        viewButtons.forEach(button => {
            button.addEventListener('click', function() {
                const viewType = this.getAttribute('data-view');

                // Remove active class from all buttons
                viewButtons.forEach(btn => btn.classList.remove('active'));

                // Add active class to clicked button
                this.classList.add('active');

                // Toggle view class on property container
                if (viewType === 'list') {
                    propertyContainer.classList.remove('property-grid');
                    propertyContainer.classList.add('property-list');
                } else {
                    propertyContainer.classList.add('property-grid');
                    propertyContainer.classList.remove('property-list');
                }
            });
        });
    }

    // Property Detail Page - Image Gallery
    window.changeImage = function(thumbnail) {
        const mainImage = document.getElementById('main-property-image');
        if (mainImage) {
            mainImage.src = thumbnail.src;

            // Update active thumbnail
            document.querySelectorAll('.thumbnail').forEach(thumb => {
                thumb.classList.remove('active');
            });
            thumbnail.classList.add('active');
        }
    };

    // Modal Functionality
    const contactBtn = document.getElementById('contact-btn');
    const scheduleBtn = document.getElementById('schedule-btn');
    const reportBtn = document.getElementById('report-btn');
    const contactModal = document.getElementById('contact-modal');
    const scheduleModal = document.getElementById('schedule-modal');
    const reportModal = document.getElementById('report-modal');
    const closeButtons = document.querySelectorAll('.close-modal');

    // Open modals
    if (contactBtn && contactModal) {
        contactBtn.addEventListener('click', function() {
            contactModal.style.display = 'block';
            document.body.style.overflow = 'hidden';
        });
    }

    if (scheduleBtn && scheduleModal) {
        scheduleBtn.addEventListener('click', function() {
            scheduleModal.style.display = 'block';
            document.body.style.overflow = 'hidden';
        });
    }

    if (reportBtn && reportModal) {
        reportBtn.addEventListener('click', function() {
            reportModal.style.display = 'block';
            document.body.style.overflow = 'hidden';
        });
    }

    // Close modals
    if (closeButtons.length > 0) {
        closeButtons.forEach(button => {
            button.addEventListener('click', function() {
                const modal = this.closest('.modal');
                if (modal) {
                    modal.style.display = 'none';
                    document.body.style.overflow = 'auto';
                }
            });
        });
    }

    // Close modal when clicking outside
    window.addEventListener('click', function(e) {
        if (e.target.classList.contains('modal')) {
            e.target.style.display = 'none';
            document.body.style.overflow = 'auto';
        }
    });

    // Modal form submissions
    const contactForm = document.getElementById('contact-form');
    const scheduleForm = document.getElementById('schedule-form');
    const reportForm = document.getElementById('report-form');

    if (contactForm) {
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault();
            alert('Your message has been sent to the agent. They will contact you shortly.');
            contactModal.style.display = 'none';
            document.body.style.overflow = 'auto';
            this.reset();
        });
    }

    if (scheduleForm) {
        scheduleForm.addEventListener('submit', function(e) {
            e.preventDefault();
            alert('Your viewing request has been scheduled. The agent will confirm the appointment.');
            scheduleModal.style.display = 'none';
            document.body.style.overflow = 'auto';
            this.reset();
        });
    }

    if (reportForm) {
        reportForm.addEventListener('submit', function(e) {
            e.preventDefault();
            alert('Thank you for your report. Our team will review it shortly.');
            reportModal.style.display = 'none';
            document.body.style.overflow = 'auto';
            this.reset();
        });
    }

    // Get property details from URL parameter
    const getPropertyDetails = function() {
        const urlParams = new URLSearchParams(window.location.search);
        const propertyId = urlParams.get('id');

        if (propertyId && document.getElementById('property-title')) {
            // This would normally fetch data from a server
            // For this example, we'll just simulate different property data based on the ID
            let propertyData = {};

            switch(propertyId) {
                case '1':
                    // Modern Family Home - already set as default
                    break;
                case '2':
                    propertyData = {
                        title: 'Luxury Waterfront Villa',
                        address: '456 Ocean Dr, Beachside',
                        price: '$1,250,000',
                        beds: '5',
                        baths: '4',
                        area: '3,800 sqft',
                        type: 'Villa',
                        year: '2015',
                        description: 'This stunning waterfront villa offers luxurious living with panoramic ocean views from nearly every room. The open concept main floor features a gourmet kitchen with high-end appliances, a spacious living room with a fireplace, and a formal dining area. The primary suite includes a private balcony, a spa-like bathroom with a soaking tub, and a large walk-in closet. Four additional bedrooms provide ample space for family and guests. The outdoor space includes a heated infinity pool, a covered patio with an outdoor kitchen, and direct access to the beach.',
                        image: 'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1475&q=80'
                    };
                    break;
                case '3':
                    propertyData = {
                        title: 'Downtown Apartment',
                        address: '789 Urban Ave, Downtown',
                        price: '$325,000',
                        beds: '2',
                        baths: '2',
                        area: '1,100 sqft',
                        type: 'Apartment',
                        year: '2019',
                        description: 'This modern downtown apartment offers urban living at its finest. The open floor plan features a stylish kitchen with stainless steel appliances, quartz countertops, and a breakfast bar. The living area includes large windows with city views and access to a private balcony. Two bedrooms, including a primary suite with an en-suite bathroom, provide comfortable living space. Building amenities include a fitness center, rooftop terrace, and 24-hour security. Located in the heart of downtown, this apartment is within walking distance to restaurants, shops, and public transportation.',
                        image: 'https://images.unsplash.com/photo-1605276374104-dee2a0ed3cd6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80'
                    };
                    break;
                default:
                    // Use default data
                    break;
            }

            // Update property details if we have data
            if (Object.keys(propertyData).length > 0) {
                document.getElementById('property-title').textContent = propertyData.title;
                document.getElementById('property-address').textContent = propertyData.address;
                document.getElementById('property-price').textContent = propertyData.price;
                document.getElementById('property-beds').textContent = propertyData.beds;
                document.getElementById('property-baths').textContent = propertyData.baths;
                document.getElementById('property-area').textContent = propertyData.area;
                document.getElementById('property-type').textContent = propertyData.type;
                document.getElementById('property-year').textContent = propertyData.year;
                document.getElementById('property-description').textContent = propertyData.description;

                // Update main image if available
                if (propertyData.image && document.getElementById('main-property-image')) {
                    document.getElementById('main-property-image').src = propertyData.image;

                    // Update first thumbnail if available
                    const firstThumbnail = document.querySelector('.thumbnail');
                    if (firstThumbnail) {
                        firstThumbnail.src = propertyData.image;
                    }
                }
            }
        }
    };

    getPropertyDetails();
});

// Add this code to your existing main.js file

document.addEventListener("DOMContentLoaded", () => {
    // Login Form Submission
    const loginForm = document.getElementById("login-form")

    if (loginForm) {
        loginForm.addEventListener("submit", (e) => {
            e.preventDefault()

            // Simulate login process
            const email = document.getElementById("email").value
            const password = document.getElementById("password").value

            if (email && password) {
                // Normally would send to server, but for this demo just redirect
                alert("Login successful! Redirecting to your dashboard...")
                setTimeout(() => {
                    window.location.href = "profile.jsp"
                }, 1000)
            } else {
                alert("Please fill in all required fields.")
            }
        })
    }

    // Signup Form Submission
    const signupForm = document.getElementById("signup-form")

    if (signupForm) {
        signupForm.addEventListener("submit", (e) => {
            e.preventDefault()

            // Get form values
            const firstName = document.getElementById("first-name").value
            const lastName = document.getElementById("last-name").value
            const email = document.getElementById("email").value
            const phone = document.getElementById("phone").value
            const password = document.getElementById("password").value
            const confirmPassword = document.getElementById("confirm-password").value

            // Simple validation
            if (!firstName || !lastName || !email || !phone || !password || !confirmPassword) {
                alert("Please fill in all required fields.")
                return
            }

            if (password !== confirmPassword) {
                alert("Passwords do not match.")
                return
            }

            // Password strength check (simple version)
            const passwordRegex = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,}$/
            if (!passwordRegex.test(password)) {
                alert("Password must be at least 8 characters long and include a number and a special character.")
                return
            }

            // Simulate signup process
            alert("Account created successfully! Redirecting to login...")
        })
    }
})
