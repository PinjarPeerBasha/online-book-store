/**
 * Loading Spinner Utility
 * Shows/hides loading overlay for async operations
 */

const LoadingSpinner = {
    overlay: null,
    
    init: function() {
        if (!this.overlay) {
            this.overlay = document.createElement('div');
            this.overlay.id = 'loading-overlay';
            this.overlay.innerHTML = `
                <div style="
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background: rgba(0, 0, 0, 0.5);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    z-index: 10000;
                    backdrop-filter: blur(2px);
                ">
                    <div style="
                        background: white;
                        padding: 30px;
                        border-radius: 12px;
                        box-shadow: 0 10px 40px rgba(0,0,0,0.3);
                        text-align: center;
                    ">
                        <div class="spinner-border text-primary" role="status" style="width: 3rem; height: 3rem;">
                            <span class="sr-only">Loading...</span>
                        </div>
                        <p style="margin-top: 15px; color: #5a5c69; font-weight: 600;">
                            Please wait...
                        </p>
                    </div>
                </div>
            `;
            this.overlay.style.display = 'none';
            document.body.appendChild(this.overlay);
        }
    },
    
    show: function(message = 'Please wait...') {
        this.init();
        const messageEl = this.overlay.querySelector('p');
        if (messageEl) {
            messageEl.textContent = message;
        }
        this.overlay.style.display = 'block';
        document.body.style.overflow = 'hidden';
    },
    
    hide: function() {
        if (this.overlay) {
            this.overlay.style.display = 'none';
            document.body.style.overflow = '';
        }
    }
};

// Make globally available
window.LoadingSpinner = LoadingSpinner;
