/**
 * Toast Notification System
 * Modern, user-friendly notifications to replace alert() calls
 */

const Toast = {
    container: null,
    
    init: function() {
        if (!this.container) {
            this.container = document.createElement('div');
            this.container.id = 'toast-container';
            this.container.style.cssText = `
                position: fixed;
                top: 20px;
                right: 20px;
                z-index: 9999;
                max-width: 350px;
            `;
            document.body.appendChild(this.container);
        }
    },
    
    show: function(message, type = 'info', duration = 4000) {
        this.init();
        
        const toast = document.createElement('div');
        toast.className = `toast-notification toast-${type}`;
        
        const icons = {
            success: '<i class="fas fa-check-circle"></i>',
            error: '<i class="fas fa-exclamation-circle"></i>',
            warning: '<i class="fas fa-exclamation-triangle"></i>',
            info: '<i class="fas fa-info-circle"></i>'
        };
        
        const colors = {
            success: '#1cc88a',
            error: '#e74a3b',
            warning: '#f6c23e',
            info: '#36b9cc'
        };
        
        toast.innerHTML = `
            <div style="
                background: white;
                border-left: 4px solid ${colors[type]};
                border-radius: 8px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.15);
                padding: 16px 20px;
                margin-bottom: 12px;
                display: flex;
                align-items: center;
                animation: slideInRight 0.3s ease-out;
            ">
                <div style="
                    color: ${colors[type]};
                    font-size: 24px;
                    margin-right: 12px;
                ">
                    ${icons[type]}
                </div>
                <div style="flex: 1; color: #5a5c69; font-size: 14px;">
                    ${message}
                </div>
                <button onclick="this.parentElement.parentElement.remove()" style="
                    background: none;
                    border: none;
                    color: #858796;
                    font-size: 20px;
                    cursor: pointer;
                    padding: 0;
                    margin-left: 12px;
                    line-height: 1;
                ">
                    &times;
                </button>
            </div>
        `;
        
        this.container.appendChild(toast);
        
        // Auto remove after duration
        if (duration > 0) {
            setTimeout(() => {
                toast.style.animation = 'slideOutRight 0.3s ease-out';
                setTimeout(() => toast.remove(), 300);
            }, duration);
        }
    },
    
    success: function(message, duration) {
        this.show(message, 'success', duration);
    },
    
    error: function(message, duration) {
        this.show(message, 'error', duration);
    },
    
    warning: function(message, duration) {
        this.show(message, 'warning', duration);
    },
    
    info: function(message, duration) {
        this.show(message, 'info', duration);
    }
};

// Add animations
const style = document.createElement('style');
style.textContent = `
    @keyframes slideInRight {
        from {
            transform: translateX(100%);
            opacity: 0;
        }
        to {
            transform: translateX(0);
            opacity: 1;
        }
    }
    
    @keyframes slideOutRight {
        from {
            transform: translateX(0);
            opacity: 1;
        }
        to {
            transform: translateX(100%);
            opacity: 0;
        }
    }
    
    @media (max-width: 576px) {
        #toast-container {
            left: 10px;
            right: 10px;
            max-width: none;
        }
    }
`;
document.head.appendChild(style);

// Make Toast globally available
window.Toast = Toast;
